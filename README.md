## Deployment

```bash
git remote add dokku dokku@students.lewagon.co:recipes
git push dokku master

# If necessary
ssh dokku@students.lewagon.co run recipes rails db:seed
```
