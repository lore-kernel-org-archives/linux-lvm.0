From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] lvcreate distributed extent option
In-Reply-To: <20021130170037.A15308@vestdata.no>
Message-ID: <Pine.LNX.4.44.0211301710350.5177-100000@pzat.meep.org>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Date: Sat Nov 30 11:25:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com


On Sat, 30 Nov 2002, [iso-8859-1] Ragnar Kj=F8rstad wrote:

> Only if you're only using a single or a few files at the time. If you're
> using many files in parallel you will get more I/O's per second by
> concatenating the devices instead if striping them. (that's what LVM
> does by default)

That of course assumes that your filesystem spreads files across the whole
lv in random and even fashion, and of cos if the contation uses two
different parts from the same disk its much slower... I have a feeling
that files are more oftain clustered towards the front of the disk. But
like with all things how you  setup your disks is very "use" dependant and
requires some degree of black magik ;-) Or atleast trying what works best
for you. Personally I have found stripping does not make my system much
faster. (Mostly I do compiling) Probably for me if I wanted to get IO,
mirroring include paths would be best, which is the best for reading,
"normal" for writting. And striping for where the data is being written,
but I guess thats why people use the jack of all trades raid 5 ;-)

I wish Lvm supported raid 5 and Mirroring...

James
