Date: Tue, 12 Oct 1999 15:59:12 +0200
From: Jens Benecke <jens@pinguin.conetix.de>
Subject: Re: [linux-lvm] Existing Linux System
Message-ID: <19991012155912.D979@earth.zuhause.de>
References: <H00004e903071d53@MHS> <199910141952.AA07775@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199910141952.AA07775@mailgate1b.telekom.de>; from Heinz Mauelshagen on Thu, Oct 14, 1999 at 09:52:29PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, linux-lvm@msede.com

On Thu, Oct 14, 1999 at 09:52:29PM +0000, Heinz Mauelshagen wrote:

> > I have an exisiting linux system. Running Mandrake 6.0. I have
> > installed sucessfully the kernel patch and the LVM software. Can I
> > convert the existing layout to use LVM?
> No conversion in means of nondestructive change of your existing
> partition based filesystems into logical volume based ones.

> > And if so how would that be accomplished.
> You have to have free disk space available (at least about 10-20% more
> than the already used space for your partition based filesystems) to set
> up a volume group containing logical volumes for /, /usr, /tmp, /var and
> so on.
> Create filesystems in these logical volumes and mount them.

Is there a kind of Migration-HOWTO included in the LVM package that tells
you how to migrate an existing system in detail?
 

-- 
_ciao, Jens_______________________________ http://www.pinguin.conetix.de

Windows NT indeed has very low Total Cost of Ownership. Trouble is,
Microsoft _owns_ Windows NT. You just licensed it.
