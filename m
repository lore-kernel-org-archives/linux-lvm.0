Message-ID: <36E7D998.7345F2C9@ep-ag.com>
Date: Thu, 11 Mar 1999 15:56:24 +0100
From: Klaus Strebel <stb@ep-ag.com>
Reply-To: antivirus@ep-ag.com
MIME-Version: 1.0
Subject: Re: [linux-lvm] Bonehead problem
References: <199903111341.OAA07416@e35.msede.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Verloove, Olivier" <olivier_verloove@merck.com>
Cc: linux-lvm@msede.com

Hi Olivier,

"Verloove, Olivier" wrote:
> 
> I have the same problem (Linux 2.2.2 + LVM 0.6).
> With or without lvm module loaded, I get:
>         vgscan -- invalid i/o protocol version
> 
> Is there another module which should be loaded at the same time ?
> lsmod gives me:
>         lvm     26960   0  (unused)
Do you have the char-device /dev/lvm (Major 109, Minor 0) ? The LVM-0.5 module
seems to create this device, if it doesn't exist. The LVM-0.6 seems not to do
this, i use devfs and i have to create the device each time before i load the
module.

Cheers
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
In Heaven there will be no DOS, no Intel, and above all, no Bill Gates.
