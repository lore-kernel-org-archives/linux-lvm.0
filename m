From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] lvm and md
Message-ID: <20030321082203.GA20320@gw.silicide.dk>
References: <001501c2ef4b$98bf6160$c70aa8c0@RD.proware.com.tw>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001501c2ef4b$98bf6160$c70aa8c0@RD.proware.com.tw>
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
Date: Fri Mar 21 02:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 21, 2003 at 09:45:47AM +0800, Rocky Lee wrote:
> > Did you use the trick by changing the partitions to
> > linux raid
> > autodetect ?
> 
> >To my knowledge most of your questions are >answered in the
> >howto's. See
> >www.tldp.org
> >for software raid howto, and LVM howto
> 
> Hi JonB
> 
> I've set the
> "persistent_superbit  1"  in raidtab
> all disk partition type were also all " raid auto detect"
> 
> then if I delete the original raidtab file and reboot.
> the system couldn't find the raid device, the LVM coundn't find the volume
> either.
> does md have to depend on the raidtab file?

Thats not how i remember the HOWTO. Maybe it just needs a raidtab file.

Which linux distribution are you running ?



JonB
