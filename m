Return-Path: <ragnark@stine.vestdata.no>
Date: Sun, 12 Aug 2001 22:46:02 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010812224602.B6589@vestdata.no>
References: <20010812135402.A452@dardhal.mired.net> <997636232.20870.2.camel@monster.omnifarious.org> <20010812222139.A14464@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010812222139.A14464@dardhal.mired.net>; from jdomingo@internautas.org on Sun, Aug 12, 2001 at 10:21:39PM +0000
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Sun, Aug 12, 2001 at 10:21:39PM +0000, Jos� Luis Domingo L�pez wrote:
> > On 12 Aug 2001 13:54:02 +0000, Jos� Luis Domingo L�pez wrote:
> > > As far as I know, there are plans to remove much of the thingss that
> > > currently appear under /proc. It seems that only information about
> > > processes currently running will remain under /proc.
> > > 
> >
> Check this linux kernel mailing list for the (still scarce) details about
> "removing" kernel tunables from /proc:
> http://uwsg.iu.edu/hypermail/linux/kernel/0105.3/1439.html
> 
> To be precise, dicussion about modifying existing /proc starts here:
> http://uwsg.iu.edu/hypermail/linux/kernel/0105.3/1469.html
> 
> There were not much discussion about the subject, but it seems that in
> 2.5.x /proc will just hold information about running processes. The rest
> is still to be defined :)

If I'm not mistaken, the idea is to move everything not process related
from procfs to a dedicated sysfs. 

I don't think it has ever been proposed to not have a fs interface to
the data, but some changes have been proposed:
* Some standard way of parsing the files (e.g. xml)
* One file pr value, rather than today's system where you have to parse 
  the files
* Changing the directory layout.


-- 
Ragnar Kjorstad
Big Storage
