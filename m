Subject: Re: [linux-lvm] RFC: DM encryption target?
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20030926124805.GA2462@gw.silicide.dk>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com>
	 <1064343664.10276.3.camel@chtephan.cs.pocnet.net>
	 <3F717F13.1050407@silicide.dk>
	 <1064404776.5915.9.camel@chtephan.cs.pocnet.net>
	 <20030924142145.GV12384@shell.blacknet.de>
	 <1064506078.31091.15.camel@chtephan.cs.pocnet.net>
	 <20030926124805.GA2462@gw.silicide.dk>
Message-Id: <1064603189.1744.264.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
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
Date: Fri Sep 26 14:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Christophe / Jon,

Are either of your code bases compatible with 2.4?

Greg
-- 
Greg Freemyer

On Fri, 2003-09-26 at 08:48, jon+lvm@silicide.dk wrote:
> On Thu, Sep 25, 2003 at 06:07:58PM +0200, Christophe Saout wrote:
> > Am Mi, den 24.09.2003 schrieb Goetz Bock um 16:21:
> > 
> > > > Another way to do a password change would be to not reencrypt the device
> > > > but to store the symmetrical key somewhere else and encrypt it with a
> > > > password hash and to just reencrypt that key with another password.
> > > That would be nice, just use the first block for the key (giving you
> > > 512byte keysize, and you can generate a realy strong key[*]).
> > > 
> > > Just in idea.
> > > 
> > > [*] yes, i know it's only as strong as the user's password. 
> > >     Security is only as good as it's weekest link, and in the end
> > >     that's always the user.
> > 
> > I don't know, but couldn't the use of a one-sector block slow things
> > down because of alignment issues? Perhaps using a 4k block would be more
> > useful or storing the sector at the end of the device (like the linux
> > raid info sector).
> 
> maybe, but does it matter? You only read the sector once, when you "open"
> the device, and write to it when you change password. During use, the real
> key is stored in memory, like any other encryption device.
> 
> 
> > I think that 512 bytes / 4096 bits should really be enough to store the
> > keys.
> > 
> > I could store the data in a simple text format, starting with a magic
> > header. Something like:
> > 
> > #CrYpT
> > version = 1
> > cipher = "aes"
> > mode = "cbc"
> > keysize = 256
> > pwdsalt = "0e3a5b4c"
> > pwdhash = "md5"
> > pwdenc = "3des"
> > key = "8e3eb...blabla..."
> > hash = "23e4f"
> > node = "/dev/mapper/crypt"
> > offset = ...useful?
> > size = ...useful? 
> 
> this could be usefull
> 
> 
> > I'm really no crypto expert, but does this sound reasonable?
> 
> yes, see how ppdd does it, or, in one week how me and my friend does it.
> 
>  
> 
> 
> JonB 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
