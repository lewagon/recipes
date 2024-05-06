## Deployment

Trigger GitHub Action


# Seed database

If necessary, you can wipe and re-seed the `Recipe` database with:

```
ssh dokku@students.lewagon.engineering run recipes rails db:seed
```
