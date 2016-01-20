References: <CAEmTpZEikmudjzJPadhreVxXBq9Lsa8bMkD20B0i1u-fMPks6Q@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <569F78FA.4050104@redhat.com>
Date: Wed, 20 Jan 2016 13:09:30 +0100
MIME-Version: 1.0
In-Reply-To: <CAEmTpZEikmudjzJPadhreVxXBq9Lsa8bMkD20B0i1u-fMPks6Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM and chain of snapshots
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Alexander Patrakov <patrakov@gmail.com>, =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JHQsNC20YPQutC+0LI=?= <g.bazhukov@ideco.ru>

Dne 20.1.2016 v 11:37 Марк Коренберг napsal(a):
> I am aware that this subject was raised in mailing lists, but I haven't found
> an obvious solution there.
>
> Why not to add an option to lvcreate when creating snapshots, to switch origin
> and snapshot ?
>
> I mean that while (in this mode) creating snapshot named xxx of volume name
> yyy, the following should be done:
>
> 1. xxx-real dmsetup volume is created with identical table as in yyy
> 2. yyy-cow dmsetup volume is created to store snapshot data
> 3. yyy is switched to table "snapshot xxx-real yyy-cow"
> 4. xxx created as "snapshot-origin xxx-real"
>

Most development now goes to 'thin' snapshot support where it
doesn't really matter what is called origin and what is the snapshot.

So with thin you get this functionality for free.

For current old-snaphot I'm now working on 'resize' support - once this
is solved we may look at this issue.

But from first look it doesn't look like it brings anything 'new' to the table.

The main thing is - what is expected state - and you seems to be targeting
for the case, where 'snapshot' is the playground which is going to be
removed after playing.

However from higher-level logic - you cannot --merge snapshot back to origin 
without unmounting  both origin and snapshot.

So there is possibly advantage where you can 'drop' snapshot,
but you can't do that without unmount first - and once you unmount,
you could equally run --merge and have instant access to merged snapshot
(where merging runs in background).

Anwyay - if you think there is 'valid' use-case - feel free to open  [RFE]
bugzilla request at bugzilla.redhat.com  for lvm2 package.

And specify use-case you want to see supported.
IMHO for best perfomance you should reorient to thin-provisioing,
since old-snapshot are in its nature not really improvable.


> Note, that having  plenty snapshots in that mode will not affect write
> performance of yyy. Yes, performance of read operations may slightly suffer
> since require to lookup chain of snapshots, but this is much less performance
> impact comparing to writes to original when plenty snapshots created (in
> generic mode).

Using lots of old-snaphosts is very bad plan - really time to look at 
thin-provisioning....
Old-snaps are not going to scale.....

Regards

Zdenek
