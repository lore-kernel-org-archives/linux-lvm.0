Subject: Re: [linux-lvm] what's different between LVM 2 and LVM 1 
In-Reply-To: Your message of "Fri, 30 Aug 2002 09:58:24 BST."
             <20020830085824.GA1090@fib011235813.fsnet.co.uk> 
References: <OF8EA0B97F.89DBA647-ON48256C25.0024512E@legend.com.cn>  
 <20020830085824.GA1090@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E17ki0Z-0007dJ-00@arwen.dev33.cvf>
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
Date: Fri Aug 30 04:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> On Fri, Aug 30, 2002 at 02:50:03PM +0800, lilha@legend.com.cn wrote:
> > I am puzzled what's different between LVM 2 and LVM 1
> > and I can't find any doc or introduction about the LVM2.
> > 
> > who is kind to tell me what is LVM2,
> > and why i should use LVM2 replace of lvm1?
> 
> LVM2 is the next version of LVM that has a couple of goals:
> 
> i) A simpler more extensible kernel driver.  This driver, called
> device-mapper, is already in the -ac series of 2.4 kernels.  Hopefully
> device-mapper will replace the LVM1 driver completely in 2.[56].
> 
> ii) Ability to more easily support the new features we want to put in.
> ATM we're concentrating on reproducing the functionality of LVM1,
> though a couple of new features (eg. writeable/fast snapshots) have
> crept in.
> 

just a stupid question :
Why does LVM2 was not a version of lvm so that we just had to upgrade LVM ?

If LVM2 is just an upgrade of LVM1, why couldn't you continue with lvm-xxxxx ?

It should have been less confusing and easier to upgrade. 

Sorry if it is abolutely stupid.

I'm using LVM1 and it works fine for me on a debian potato with a 2.4.18 
kernel with hardware RAID5 . Thank you for your work.


Pierrick
