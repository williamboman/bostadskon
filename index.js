const fs = require('fs')
const path = require('path')
const axios = require('axios')
const Handlebars = require('handlebars')

const readFile = (file) => new Promise((resolve, reject) => {
    fs.readFile(file, (err, data) => {
        if (err) {
            reject(err)
        } else {
            resolve(data)
        }
    })
})

const filterListing = (listing) =>
    (listing.Ungdom === true || listing.Kortid === true)

const sortListing = (a, b) =>
    a.Yta > b.Yta ? 1 :
    a.Yta < b.Yta ? -1 :
    0

async function main() {
    const listings = await axios.get('https://bostad.stockholm.se/Lista/AllaAnnonser').then(res => res.data)
    const filteredListings = listings.filter(filterListing).sort(sortListing)
    const source = await readFile(path.join(__dirname, 'mail.tpl'))
    const template = Handlebars.compile(source.toString())
    const imgSrc = await readFile(path.join(__dirname, 'svg-logo.base64'))
    console.log(template({
        imgSrc: `data:image/svg+xml;base64,${imgSrc}`,
        listings: filteredListings,
        totalListingCount: listings.length,
    }))
}

main().then(x => process.exit(x))
