Message-ID: <3D64D5B5.3010209@mindmatics.de>
From: Andreas Baier <andreas.baier@mindmatics.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange behaviour on a SuSE8.0 with LVM
References: <3D6226F9.8080906@mindmatics.de> <20020822133443.A5699@sistina.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Aug 22 07:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


Hello,

thank you for the quick response.
What runied my fs is nit yet known to me. The disk is ok,  but now I 
know, which programm causes the ioctl - it is badblocks from e2fstool 
Version 1.26


> This is an ioctl command not supported by the LVM driver.
> Check which tool is run so rapidly and you know who causes it.

> Hmmm...
> 
> You didn't mention when the FS was fully checked successfully last time.
> If there was no other device errors after that check, it got probably toasted
> by VM or FS bugs.


I was lucky, the machine was freshly installed and ran just a few 
days, but the home-dir was totally gone. Since home is on a logical 
volume I wondered if it could be a problem. But since LVM 0.9.x I am 
using it and never had problems.


Thank you !

Andreas
