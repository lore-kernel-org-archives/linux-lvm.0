From: vegh@omega.telia.net
Subject: Re: [linux-lvm] Strange hard drive behaviour
In-Reply-To: <20030405173116.GA27048@mitethe.eudyptes>
Message-ID: <Pine.LNX.4.44.0304141719490.25462-100000@omega.telia.net>
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
Date: Mon Apr 14 09:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I dont think it is hardware failure. These are brand new servers, and I 
got the same behaviour on all of them I installed. It is not a clicking 
noise, rather a very fast "crackling" noise. We are using RAID1, so the 
different speeds of the drives can be a problem. On the same machine I 
tried to create a file system and copy data with an without LVM. I got the 
noise only when I use LVM. I suspect stripping over the same disk could 
casue something like this, but I have one PV per physical disk, and dont 
specify the -i and -I option when I do lvcreate. I will do some further 
tests.

Thanks for your time,
Norbert Vegh

> That nasty click is an IDE drive resetting itself.  Failure may be
> moments away.  In the hardware RAID you described, it may be a bit
> harder to isolate which drive is dying ... you may actually have to
> get your head next to each one to find it.
> 
> The problem then is that you need to evacuate that PV (which may be the
> whole array from your description of the setup) and replace the faulty
> drive.  You may be able to take less drastic action, depending upon the
> capabilities of your RAID card.
> 
> If you are mirroring, you can also get this if one of the drives in the
> mirror is slower than the other (also happens if you are striping, but
> you said that you weren't).
> 
> While drives can live for months this way, they drag your system
> performance to the ground and eventually fail anyway.  Get out
> while you can still save your data!
> 
> 
> Michael Kellen
> 
