Date: Sat, 17 Jun 2000 00:48:14 +0200 (CEST)
From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux  Community
In-Reply-To: <85256900.006F9EE2.00@d54mta02.raleigh.ibm.com>
Message-ID: <Pine.LNX.4.21.0006170041460.5889-100000@inspiron.random>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: Andi Kleen <ak@suse.de>, linux-lvm@msede.com, sbest@us.ibm.com

On Fri, 16 Jun 2000 benr@us.ibm.com wrote:

>My understanding of what is in 2.4-latest is that you do indeed have the
>stacking of multiple block translation modules, but the implementation of
>this is not as flexible or integrated as what we have described in the
>white paper.   Please correct me if I am wrong!

raid0 is fully integrated into the LVM into 2.4.0-test1-ac19. While
allocating a logical volume you can choose to allocate the physical space
from different physical devices and to stripe onto them in raid0.

For raid1/5 you're right: they are not integrated into the current LVM but
they instead live in a separate layer (MD) (and running LVM on top of MD
is more expensive for the CPU and less flexible for the sysadm than if
raid1/5 would be lvm plugins).

Andrea
