Subject: Re: [linux-lvm] Is there a LVM(2?) patch for 2.5.x yet?
Message-ID: <1033466506.3d99728a72c39@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
References: <20020930221930.GA15549@localhost> <1033424879.30743.2.camel@UberGeek.coremetrics.com>
In-Reply-To: <1033424879.30743.2.camel@UberGeek.coremetrics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Oct  1 05:02:08 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Quoting Austin Gonyou <austin@coremetrics.com>:

> On Mon, 2002-09-30 at 17:19, Jos� Luis Domingo L�pez wrote:
> > On Monday, 30 September 2002, at 12:05:13 -0500,
> > Austin Gonyou wrote:
> > 
> > > I really need to test 2.5.x and I can't ATM because of LVM patch
> > > problems. Can someone tell me what's going on with LVM and 2.5?
> > > 
> > In the course of a long thread on linux-kernel mailing list (thread
> > called "Re: v2.6 vs. v3.0") someone said that lack of a working LVM
> in
> > 2.5.x was keeping away a lot of potential kernel testers.
> > 
> 
> Thanks much for replying. I actually wrote Heinz directly as well, but
> it appears those mails  bounced, he's got too much in his in-box. 
> 
> > Someone said there have been seen patches to update LVM1 in 2.5.x to
> a
> > working state, but the consensus seem to be that 2.5.x will include
> > LVM2
> > instead. Someone on the list offered to check for the availability
> of
> > current LVM2 patches against 2.5.x and begin the "transition". This
> > person is also subscribed to this list, IIRC.
> 
> As was my understanding from just a few months ago when the kernel
> feature list was created.
> 
> > So in the following days someone should say something specific in
> that
> > respect (at least, many people hope so, Halloween feature freeze is
> > jsuta a month away :)
> 
> 
> Yes..I know..and now it's time to start testing for functionality Lo
> and
> behold, LVM doesn't work on 2.5.39. Last time it did, Rik estimated,
> around 2.5.7 or so. :(
actually there were some patches floating for 2.5.18 and there were some 
patches in -dj as well but i've not tried -dj since 2.5.25 i think
you can find the patch for 2.5.18 on linuxhq's unofficial patches for 2.5

and may be evms is getting in shape so we can use it in order to have access to 
our lvm volumes 

svetljo
