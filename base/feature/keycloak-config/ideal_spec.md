spec:
  identityProviders:
    - mappingMethod: claim
      name: keycloak
      openID:
        claims:
          email:
            - email
          name:
            - name
          preferredUsername:
            - preferred_username
        clientID: ocp-console-login
        clientSecret:
          name: keycloak-client-secret
        extraScopes: []
        issuer: 'https://keycloak.apps.plaid.phalnet.com/realms/UnderdarkAuthServices'
      type: OpenID
