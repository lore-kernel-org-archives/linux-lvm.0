Message-ID: <37371CFE.F8B329D4@ep-ag.com>
Date: Mon, 10 May 1999 17:53:02 +0000
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: [linux-lvm] Local GFS on lvm
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi all,

has anybody got a working local gfs (without dlocks) on an lvm-volume.
After hacking passemble i could manage to activate the pool device, but
when i dd from it, all i get is a lvm oops (should never happen ;-)) and
my dd hangs :-(. I tried the latest GFS from 08/05/1999.

Any ideas?

Ciao
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
In Heaven there will be no DOS, no Intel, and above all, no Bill Gates.
