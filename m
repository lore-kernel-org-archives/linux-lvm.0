Date: Thu, 24 Aug 2000 01:36:13 +0200
From: Jan Niehusmann <list039@gondor.com>
Subject: [linux-lvm] lvm RPM for Mandrake
Message-ID: <20000824013613.A28564@gondor.com>
Reply-To: jan@gondor.com
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Yesterday I created a Mandrake-compatible RPM containing the lvm tools. It's
available from the mandrake-mirrors in .../mandrake-devel/contrib/(S)RPMS/lvm*

What's still missing from these RPMS is a proper rc script to enable lvm after
booting. As the rc I'm using myself is rather specialized, I ask you if someone
has an rc script that handles lvm on md devices and other non-standard setups
in a generalized way.

Jan
