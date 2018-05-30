References: <5B0E6D96020000F90001F644@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c7364072-150e-e3ea-3eda-01c601729758@redhat.com>
Date: Wed, 30 May 2018 16:12:23 +0200
MIME-Version: 1.0
In-Reply-To: <5B0E6D96020000F90001F644@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove does not work at all with version 2.02.177(2)
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 30.5.2018 v 11:23 Gang He napsal(a):
> Hello List,
> 
> As you know, I ever reported that lvcreate could not create a mirrored LV, the root cause is a configure building item "--enable-cmirrord" was missed.
> Now, I encounter another problem, pvmove does not work at all.
> The detailed information/procedure is as below,


Hi

Can you try to compile 2.02.178 ?

I believe there were some more fixes for reworked pvmove locking.

Regards

Zdenek
