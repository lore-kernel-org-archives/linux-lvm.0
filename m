Message-ID: <54291F5F.8040806@redhat.com>
Date: Mon, 29 Sep 2014 10:59:11 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1411839754687039500@businessgrade.com>
	<CAKAA-nmnZHXQBMcfh-tzs8qO5rf6tfrM3wTf8qg3R_11MGkupw@mail.gmail.com>
In-Reply-To: <CAKAA-nmnZHXQBMcfh-tzs8qO5rf6tfrM3wTf8qg3R_11MGkupw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why is my LVM Mirror performance so bad?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, eneal@businessgrade.com

Dne 27.9.2014 v 22:35 Micky napsal(a):
> Because it is LVM! :)
>

And that's what I call  'Very helpful answer'

> On Sat, Sep 27, 2014 at 10:42 PM, Errol Neal <eneal@businessgrade.com
> <mailto:eneal@businessgrade.com>> wrote:
>
>     Hi There. Hoping to get some clarity on some performance woes in a little
>     testing environment that I've setup.
>
>     I am experimenting with LVM mirrors on a CentOS 6.5 cluster.
>

Are you using  'exclusive' single node activation - or is your
mirror active on multiple nodes  with cmirrord ?



>     I have two VMs running on ESX5.5 that are sharing two RDM luns from an SRP
>     target server running SCST.
>
>     Performance however seems to take a huge hit compared to a vanilla volume
>
>
>     [root@scst1 ~]# vgs
>        VG       #PV #LV #SN Attr   VSize   VFree
>        hadata     2   5   0 wz--nc 999.99g 149.99g
>        vg_scst1   1   2   0 wz--n-  39.51g      0
>
>     [root@scst1 ~]# lvs -a -o +devices


lvs -a -o+lv_active


If you don't need cluster-wide mirror activation - use the local version:

lvchange -aey  vg/mirror


Note - new mdraid is supported only in 'exlusive' mode.

Zdenek
