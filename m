Date: Mon, 28 Jun 1999 18:51:43 -0400 (EDT)
From: will <will@mail.firesites.com>
Reply-To: will <will@mail.firesites.com>
Subject: [linux-lvm] LVM and CRC file errors
Message-ID: <Pine.LNX.3.95.990628181230.889C-100000@mail.firesites.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I have ran into strange problem while using LVM.  When implementing a
volume group with multiple physical volumes, I have noticed that when I
fill up the first pv and data begins to write to the second pv, I am
getting checksum differences.  To state more clearly, I compare the
checksums of the same files (from files located in the first pv, and files
located in the second pv) and they are different.  To correct this
situation, I have to copy the data multiple times and compare the
checksums until they are the same.

The details of my system are:
Redhat 6.0 with 2.2.5 kernel and LVM 0.6 patch (no other patches
installed)
5 pv volume group consisting of the following in order:
  20 GB Western Digital EIDE
  7.1 GB Western Digital EIDE
  4.1 GB Seagate Hawk SCA SCSI
  4.1 GB Seagate Hawk SCA SCSI
  4.1 GB Seagate Hawk SCA SCSI

I was wondering if anyone else has come across this problem or if it's
just a fluke on my part.  I will retest the scenario on a different system
and let you know what the outcome is.

I am posting this because I am now using software raid (linear) on the
same system and the checksum problem does not exist.

Regards,
Will
