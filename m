From: Spam <spam@tnonline.net>
Message-ID: <1694936487.20031208171542@tnonline.net>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
In-Reply-To: <1070899120.9011.41.camel@hotbox>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
 <1070897481.9011.38.camel@hotbox>  <1070854294.1569.23.camel@avalon>
 <1070899120.9011.41.camel@hotbox>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Mon Dec  8 10:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Matt <linux-lvm@sistina.com>

>> > So, if your drive gets bad blocks, you can very quickly be rebuilding
>> > your entire filesystem ( I lost a TB on a RAID where one drive develop=
ed
>> > some bad blocks.)
>>=20
>> You must have been running RAID0, otherwise one drive wouldn't matter.
>>=20
>> > Just keep in mind stability.
>>=20
>> I'm removing harddrives with bad blocks immediately - and running RAID5.
>>=20
>> I'm definitively not missing that feature ;-)


> I was running RAID5.

Then  a  bad drive should not matter or you have done something wrong.
RAID5  has  redundancy for one drive so you should not loose any data.
But  agreed.  Bad  blocks  management  is  a  needed  feature  of  any
filesystem. Just as defragment support utils.

From=20what I understood is Reiser4 going to improve on all areas.

Performance wise no FS should be very slow on big files? Or what did I
miss?

> Matt sChillinger
