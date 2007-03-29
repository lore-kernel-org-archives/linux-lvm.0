Message-ID: <460BCFBB.1050705@jeppesen.com>
Date: Thu, 29 Mar 2007 16:39:55 +0200
From: Olle Liljenzin <olle.liljenzin@jeppesen.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to re-stripe a LV after pvmove?
References: <460BA637.9050604@carmen.se> <20070329123929.GA7718@redhat.com>	
	<460BC7C2.3060206@jeppesen.com>
	<1175178543.4142.8.camel@linux-cxyg.rtp.netapp.com>
In-Reply-To: <1175178543.4142.8.camel@linux-cxyg.rtp.netapp.com>
Content-Transfer-Encoding: 7bit
Reply-To: olle@carmen.se,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Wysochanski <dwysocha@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: mauelshagen@redhat.com

Yes, it works!

/Olle

Dave Wysochanski wrote:
>
> looks like you need something like this:
>
> pvmove /dev/sdb2:9-17 /dev/sdb4:0-8
>
>   
