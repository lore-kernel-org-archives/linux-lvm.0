Date: Thu, 18 May 2000 19:04:12 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] How can activate the LVM in start
Message-ID: <20000518190412.A17863@home.ds9a.nl>
References: <00a201bfbe75$7395a020$4b1f04d5@migue> <20000515194742.A1442@home.ds9a.nl> <3923FAAF.A3E2A2D3@netconnect.com.au>
Mime-Version: 1.0
In-Reply-To: <3923FAAF.A3E2A2D3@netconnect.com.au>; from bug1@netconnect.com.au on Fri, May 19, 2000 at 12:14:07AM +1000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Fri, May 19, 2000 at 12:14:07AM +1000, bug1 wrote:

> Im no kernel hacker, but just wondering, would it be possible to get the
> kernel to autodetect lvm partitions in a similar way that raid
> autodetection works, or would it not be possible because of LVM's
> userland tools.

It is both possible and desireable. It is not easy however. Doing
'userland things' in the kernel requires immaculate code. Furthermore, the
kernel puts a lot of restraints on what is possible.

Regards,

bert hubert.

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
