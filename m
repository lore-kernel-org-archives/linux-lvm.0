Message-ID: <3E51F401.30702B9C@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] encryption in LVM2
References: <3E510115.C2FF3B83@silicide.dk> <20030217203406.GA6846@localhost> <20030218014556.L14285@zealot.blacknet.de>
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
Date: Tue Feb 18 02:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Goetz Bock wrote:
> 
> On Mon, Feb 17 '03 at 21:34, Jose Luis Domingo Lopez wrote:
> > I don't know of anyone working on block-based encryption for LVM2/DM,
> > but by now you can try one of the several filesystem-level encryption
> > solutions out there. I have personally used loop-aes
> hint: loop-aes is a block-based encryptor. It just happens to operate on
> blocks in files, due to the limitations of loop device driver.
> 
> writing a personality for lvm2 to do blocklevel encryption would be nice

thats what i figured, and i have this linux kernel course at my
university,
so why not actually write something usefull, and since LVM2 is done, and
encryption is done, how hard can it be combining the 2 ;-D

 
> OTOH a group aware filesystem level encryption would be realy cool.

reiserfs4 ? i heard some rumors about encryption, i dont know about
group awareness, but thats the advantage you get with a blocklevel
encryption, you can put any FS ontop.



JonB
