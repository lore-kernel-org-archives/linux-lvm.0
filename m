Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
    <E16OSId-0005Vf-00@hermes.sistina.com> <20020115151621.E11005@sistina.com>
In-Reply-To: <20020115151621.E11005@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16QVD9-0003HS-00@hermes.sistina.com>
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
Date: Tue Jan 15 09:10:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

On Wed, 16 Jan 2002 00:16, Heinz J . Mauelshagen wrote:
> > The lvm.c change you talk about I assume is the LVM_VFS_ENHANCEMENT
> > change? For some reason when adding the lvm-1.0.1 upgrade patch this
> > disappears from lvm.c   I have been able to get this to compile with the
> > change but I have forgoten what I did.
> >
> > This is one question I would like answered by the LVM gurus:  should
> > #define LVM_VFS_ENHANCEMENT still be there after upgrading to lvm-1.0.1?
>
> Yes.

I have found that using the generated lvm-1.0.1 upgrade patch that the 
#define LVM_VFS_ENHANCEMENT gets removed.  If all I do is add it back in 
manually - do I need to worry about other areas of the code that also need 
touch-ups?  How would I tell?

Thanks

-- 
Adrian Head

(Public Key available on request.)
