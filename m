Message-ID: <3E51F34A.55A8CF23@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] encryption in LVM2
References: <3E510115.C2FF3B83@silicide.dk> <20030217203406.GA6846@localhost>
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
Date: Tue Feb 18 02:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jose Luis Domingo Lopez wrote:
> 
> On Monday, 17 February 2003, at 16:34:45 +0100,
> Jon Bendtsen wrote:
> 
> > I only have experience with LVM1, but naturaly i've heard about LVM2,
> > and the device mapper.
> > Has anyone built in encryption into the device mapper ?
> > Is anyone working on it ?
> >
> I don't know of anyone working on block-based encryption for LVM2/DM,
> but by now you can try one of the several filesystem-level encryption
> solutions out there. I have personally used loop-aes, it is simple to
> set up and works ok on my boxes.

been there, done that. The problem is that then i cant use the snapshot
facility while the stuff is mounted, and i cant resize it while it is
mounted. I'd like that feature. Okay, i could just encrypt the
partition(s)
below LVM, but that is troubled too, as i might not want to encrypt all
my LV's, and either i might have to start severel loopback devices.
And as for loop-aes... no thanks, i cant even change my password.

> Hope it helps.

not really.



JonB
