Subject: Re: [linux-lvm] EXT3 vs Reiserfs
From: Matt <mschilli@vss.fsi.com>
In-Reply-To: <1070854294.1569.23.camel@avalon>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
	 <1070897481.9011.38.camel@hotbox>  <1070854294.1569.23.camel@avalon>
Message-Id: <1070899120.9011.41.camel@hotbox>
Mime-Version: 1.0
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
Date: Mon Dec  8 09:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2003-12-07 at 21:31, Markus Schiltknecht wrote:
> On Mon, 2003-12-08 at 16:31, Matt wrote:
> > So, if your drive gets bad blocks, you can very quickly be rebuilding
> > your entire filesystem ( I lost a TB on a RAID where one drive developed
> > some bad blocks.)
> 
> You must have been running RAID0, otherwise one drive wouldn't matter.
> 
> > Just keep in mind stability.
> 
> I'm removing harddrives with bad blocks immediately - and running RAID5.
> 
> I'm definitively not missing that feature ;-)
> 

I was running RAID5.

Matt sChillinger

> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
