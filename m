From: Anders Widman <andewid@tnonline.net>
Message-ID: <95154593687.20021106141700@tnonline.net>
Subject: Re: [linux-lvm] LV Fragmentation determination
In-Reply-To: <20021106135537.A1228@sistina.com>
References: <Pine.LNX.4.44.0211060108110.8692-100000@junior.lunanet.biz>
 <20021106135537.A1228@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Nov  6 07:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Heinz J . Mauelshagen" <linux-lvm@sistina.com>

>> First off, can LV's become fragmented across a PV/VG? If yes then...

> Yes, they can.

>> 
>> I'm looking for an easy way to determine how fragmented an LV might been
>> inside the VG. Is there any command I can run that'll give me nice
>> estimate on this?

> You can analyze the "lvdisplay -v" output on your LVs in question.
> That shows you the mapping information and therefore, if your LVs are
> fragemented.

Will LVM include a defragment procedure?
