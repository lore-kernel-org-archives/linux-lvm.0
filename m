Date: Thu, 18 Oct 2001 14:09:02 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvchange and stripes
Message-ID: <20011018140902.H564@tykepenguin.com>
References: <200110180957.f9I9v8a04929@lap1.mtg.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200110180957.f9I9v8a04929@lap1.mtg.at>; from andreas@mtg.co.at on Thu, Oct 18, 2001 at 11:57:03AM +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 18, 2001 at 11:57:03AM +0200, Andreas Kostyrka wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi!
> 
> I've got a problem that seems to striping related: I cannot extend dev lv, 
> probably because LVM insists upon splitting the LV to 3 discs.
> 
> Now my problem is, that I haven't found a way to change the stripe 
> configuration of a LV. :(

I'm afraid thats a current limitation on striped LVs. The only way to extend one
after the disks become full is to pvmove the stripes onto 3 new disks :-( 


patrick
