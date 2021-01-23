import 'package:functions_framework/functions_framework.dart';

import 'package:shelf/shelf.dart';

@CloudFunction()
Response function(Request request, RequestLogger logger) {
  // If we can't get both the code and state from the request it's probably an
  // error message so just send back the original url
  if (request.requestedUri.queryParameters['code'] == null ||
      request.requestedUri.queryParameters['state'] == null) {
    return Response.ok(request.requestedUri);
  }

  // logger.log(`Exchanging code for tokens...`);

  return Response.ok('hhelo!');
}

//   // Build the post string from an object
//   const post_data = querystring.stringify({
//     'grant_type' : 'authorization_code',
//     'client_id' : project_credentials.asana.client_id,
//     'client_secret' : project_credentials.asana.client_secret,
//     'redirect_uri' : project_credentials.asana.redirect_uri,
//     'code' : req.query.code,
//   });

//   const resp = await axios.post('https://app.asana.com/-/oauth_token', post_data);

//   const email = resp.data.data.email;

//   logger.log('Converting email to Firebase UID...');

//   const userRecord = await authService.getUserRecordByEmail(email);

//   logger.log('Saving tokens...');

//   const tokens = {
//     refresh_token: resp.data.refresh_token,
//     access_token: resp.data.access_token,
//     expires_in: resp.data.expires_in,
//   }

//   await authService.saveAsanaCredentials(userRecord.uid, tokens);

//   logger.log('Saving finished state to database...');

//   await authService.updateAuthorizationStatus(userRecord.uid, ProviderName.Asana, AuthorizationStep.Authorized);

//   // Close the window, the entry in database will update the UI of the original window
//   return res.send(`
//     <head>
//     </head>
//     <body>
//       <div>Credentials have been saved, you can close this window.</div>
//     </body>
//     <script>
//       window.close();
//     </script>
//   `);
// } catch(error) {
//   logger.error(error);
//   return res.status(500).send(`Something went wrong while exchanging the code. \n ${error}`);
// }
