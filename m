Subject: Re: [linux-lvm] Drive failure
References: <20030515203908.66A9CAE4F5@basilica.la.naos.co.nz>
	<200305151834.10480.bjzolp@wisc.edu>
From: Urs Thuermann <urs@isnogud.escape.de>
In-Reply-To: <200305151834.10480.bjzolp@wisc.edu>; from "B. J. Zolp" on Thu, 15 May 2003 18:34:10 -0500
Message-ID: <m27k8ow1wg.fsf@isnogud.escape.de>
MIME-Version: 1.0
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
Date: Sun May 18 13:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"B. J. Zolp" <bjzolp@wisc.edu> writes:

> I'm doing a
>  dd bs=512 conv=noerror,sync if=/dev/hdf of=/dev/null 
> right now.  It has been going for a few hours, but does not seem to be taking 
> up any cpu cycles (it looks hung up).  I will let it go over night and see 
> how it is tomorrow.  What would you suggest I do if the I can only get the 
> data on the HD up until the bad sector (or where ever it is hung up).  This 
> is the last drive in the logical volume, so there was not too much data on 
> it, but how would I go about added the new replacement drive to the logical 
> volume without messing up my entire filesystem?

You could also try dd_rescue(1), which was written, AFAIR, by Kurt
Garloff.  You should find it using Google.


urs
