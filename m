Message-ID: <15AD5D7936F8D21198240000F831776E3E815C@dboexc1.dbo.cpqcorp.net>
From: "Jakma, Paul" <Paul.Jakma@compaq.com>
Subject: [linux-lvm] LVM seems to break tar and cp "stay-local" options
Date: Tue, 25 Jan 2000 17:59:31 -0000
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

While LVM'ising my system, i wanted to copy my root fs over. I had a small
root, with most stuff like /usr, /home and /var on LVM volumes and mounted
on /. I tried tar with it's "stay on local filesystem" (-l iirc) however, it
started to copy /home to my temporary mount aswell. I tried with cp -ax, and
it too did failed to recognise /home as being on a different fs to /.

This was on RH6/Alpha.

regards,

Paul Jakma.
