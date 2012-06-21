Message-ID: <4FE2E5B9.6020400@redhat.com>
Date: Thu, 21 Jun 2012 11:13:29 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1340120294.2712.7.camel@globesm.com>
In-Reply-To: <1340120294.2712.7.camel@globesm.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm create a large amount of lv seems problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Amos.Huang" <ch.linux.free@gmail.com>

Dne 19.6.2012 17:38, Amos.Huang napsal(a):
> Hi,all.
> 	I hava two hard disk.I create two physical-volume,and on the two
> physical-volume created a volume-group.
>
> I run the following shell:
> for(( i = 0; i < 400; i++));do
> 	lvcreate -L 1G volume-group
> done
>
> But it whill missing pv with 'UUID' ,occasionally!
>
> Who can help me?Thanks!!
>


I think you have not mentioned  your OS  (Fedora, Debian.. ?)
You have also missed to specify version of lvm2 ?

Trace of failing command with -vvvv would be very useful.

Zdenek
