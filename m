Message-ID: <4F5A0928.70502@redhat.com>
Date: Fri, 09 Mar 2012 14:44:08 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <A0D9F519724C4648B433C8FA859E3EBB7CD3F152@EX01.sogou-inc.com>
In-Reply-To: <A0D9F519724C4648B433C8FA859E3EBB7CD3F152@EX01.sogou-inc.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to adjust the virtual size of Thin Provisioning
	Volume?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Kirby Zhou <kirbyzhou@sogou-inc.com>

Dne 7.3.2012 09:33, Kirby Zhou napsal(a):
> As title
> 
> Regards
> Kirby Zhou
> 
>

Just use normal lvresize/lvextend/lvreduce command -  i.e.:

lvresize -L+100M vg/thinvol


Zdenek
