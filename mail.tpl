<html>
    <head>
        <meta charset="UTF-8">
        <style>
            body {
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            }
        </style>
    </head>
    <body>
        <table>
            <tbody>
                <tr>
                    <td>
                        <img src="{{imgSrc}}" height="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <small>Här kommer alla aktiva annonser för idag ({{listings.length}}/{{totalListingCount}} st.).</small>
                    </td>
                </tr>
            </tbody>
        </table>
        <table>
            <thead>
                <tr>
                    <td>Adress</td>
                    <td>Yta (kvm)</td>
                    <td>Hyra (SEK)</td>
                    <td>Ungdom</td>
                    <td>Korttid</td>
                    <td>T.o.m.</td>
                </tr>
            </thead>
            <tbody>
                {{#each listings}}
                    <tr>
                        <td>
                            <a href="https://bostad.stockholm.se{{{this.Url}}}">
                                <strong>{{this.Gatuadress}}</strong> - {{this.Kommun}}
                            </a>
                        </td>
                        <td>
                            {{this.Yta}}
                        </td>
                        <td>
                            {{this.Hyra}}
                        </td>
                        <td>
                            {{#if this.Ungdom}}
                                Ja
                            {{else}}
                                Nej
                            {{/if}}
                        </td>
                        <td>
                            {{#if this.Korttid}}
                                Ja
                            {{else}}
                                Nej
                            {{/if}}
                        </td>
                        <td>
                            {{this.AnnonseradTill}}
                        </td>
                    </tr>
                {{/each}}
            </tbody>
        </table>
    </body>
</html>
