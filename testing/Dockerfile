FROM archlinux:latest

COPY etc /etc

# Create user zshtester and set up sudo privileges
RUN useradd zshtester -m && \
    passwd -d zshtester && \
    echo 'zshtester ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Copy afterboot.sh to root to run post-startup configurations
COPY testing/afterboot.sh /afterboot.sh
COPY testing/pkgs.txt /pkgs.txt
RUN chmod +x /afterboot.sh

CMD ["/bin/sh", "/afterboot.sh"]

