Return-Path: <john@oswf.de>
From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15142.14490.198721.492790@rigel.oswf.de>
Date: Tue, 12 Jun 2001 17:43:22 +0200 (MEST)
Subject: Re: [linux-lvm] Re: [reiserfs-list] Reiserfs fragments my MP3
In-Reply-To: <200106121224.AA248918644@fb0442.mathematik.tu-darmstadt.de>
References: <3B2605AB.703A7F67@in.tum.de>
	<200106121224.AA248918644@fb0442.mathematik.tu-darmstadt.de>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Holger Grothe writes:
> Hello,
> > 
> > >
> > > BTW: It isn't clear from your previous mail that this in fact a
> > > filesystem problem. The output from fsck may or may not confirm that it
> > 
> > Though this is a big off-topic, I have compiled the 2.4.5 kernel with reiser
> > within it, but I moved back immediatedly  to 2.4.4 after I saw that
> > unmounting a Reiserfs LV causes an oops -- and a kernel hang when trying to
> > unmount further Reiserfs LVs... ouch... not strange that there might be data
> > corruption with this kernel version!
> > 
> Known problem. Get the fix from the download section of
>       http://www.namesys.com/

hmmm, it seens to fixed in at least 2.4.5-ac9. Currently, I have a
2.4.5-ac13 running with Reiserfs LV. So far, no problems.

Regards

Werner
