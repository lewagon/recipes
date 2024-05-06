## Deployment

```bash
git remote add dokku dokku@students.lewagon.engineering:recipes
git push dokku master

# If necessary
ssh dokku@students.lewagon.engineering run recipes rails db:seed
```
