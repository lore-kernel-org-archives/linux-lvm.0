References: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <fc8a330f-15dc-4e03-8b5d-b3e385366265@redhat.com>
Date: Tue, 29 Sep 2020 12:41:10 +0200
MIME-Version: 1.0
In-Reply-To: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvresize cannot refresh LV size on on other hosts
 when extending LV with a shared lock
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

Dne 29. 09. 20 v 10:46 Gang He napsal(a):
> Hello List,
> 
> I am using lvm2 v2.03.10(or v2.03.05), I setup a lvm2-lockd based (three nodes) cluster.
> I created PV, VG and LV, formated LV with a cluster file system (e.g. ocfs2).
> So far, all the things work well, I can write the files from each node.
> Next, I extended the online LV from node1, e.g.
> ghe-tw-nd1# lvresize -L+1024M vg1/lv1
>    WARNING: extending LV with a shared lock, other hosts may require LV refresh.
>    Size of logical volume vg1/lv1 changed from 13.00 GiB (3328 extents) to 14.00 GiB (3584 extents).
>    Logical volume vg1/lv1 successfully resized.
>    Refreshing LV /dev//vg1/lv1 on other hosts...
> 
> But, the other nodes cannot aware this LV size was changed, e.g.


lvmlockd  does not care about state of LV.

This used to be achieved through clvmd code - but such code is no longer 
available with 2.03 branch.

The assumed solution is - the user is supposed to write an engine on top of 
lvm2 using some 'clustering' solution  and and orchestrate this work himself
(i.e. in this case run  'lvchange --refresh' on other hosts himself
somehow in-sync)


Zdenek
