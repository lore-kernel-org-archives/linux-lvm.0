From: =?utf-8?Q?Stefan_Bauer?= <sb@plzk.de>
Date: Fri, 25 Nov 2016 10:17:02 +0100
Mime-Version: 1.0
Sender: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Message-Id: <kcim.5838018e.2209.36b950052698aabe@ucs.cubewerk.intern>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?LVM_general_discussion_and_development?= <linux-lvm@redhat.com>, =?utf-8?Q?Peter_Rajnoha?= <prajnoha@redhat.com>

Hi Peter,

as i said, we have master/slave setup _without_ concurrent write/read. So i do not see a reason why i should take care of locking as only one node is activating the volume group at the same time.

That should be fine - right?

Stefan
-----Ursprüngliche Nachricht-----
> Von:Zdenek Kabelac <zkabelac@redhat.com>
> 
> If you are working with 'shared' storage and manipulating  same VG from 
> multiple nodes (i.e. activation) - it's not so easy to go without really good 
> locking manager.
> 
> If you don't like clvmd - maybe you could take a look at lvmlockd & sanlock.
> 
> But you should be aware there are NOT many people who are able to ensure 
> correct locking of lvm2 commands -  it's really not just 'master/slave'.
> There are big number of error cases which do not proper locking around
> the whole cluster.
