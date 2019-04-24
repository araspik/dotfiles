#   ZSh Config: Logout
# ======================

# Logout Hooks
# ============
for func in $logout_functions; do
    eval "$func"
done
