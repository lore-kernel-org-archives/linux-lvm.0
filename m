Date: Wed, 12 Apr 2000 20:37:11 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: [linux-lvm] [ahu@ds9a.nl: [PATCH] combined LVM patch updated for 2.3.99pre5]
Message-ID: <20000412203711.A2276@home.ds9a.nl>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi everybody,

This is to announce a link to a combination of two patches for 2.3.99pre3,
merged and upgraded for 2.3.99pre5. The end result is that Linux 2.3.99pre5
then has the latest & greatest in Logical Volume Management.

The original patches are

* By Heinz, the LVM gut:	http://ds9a.nl/lvm-howto/2.3.99pre3
* By Andrea Arcangeli:		http://ds9a.nl/lvm-howto/andrea.patch

I haven't done wide testing, but everything seems to work here about as well
as it did in 2.3.99pre3. Please do sane things before applying (full backup
would be nice).

As a side note, it also includes the tiny MD_MAX_DEV fix.

The combined patch is on http://ds9a.nl/lvm-howto/2.3.99-pre5.lvm.patch

Regards,

bert hubert.

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
