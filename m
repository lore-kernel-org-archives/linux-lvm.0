Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B2605AB.703A7F67@in.tum.de>
Date: Tue, 12 Jun 2001 14:06:03 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: [reiserfs-list] Reiserfs fragments my MP3
References: <20010610222138.A21955@mind.bartosch.net> <20010610222719.B21955@mind.bartosch.net> <20010611064459.C21955@mind.bartosch.net> <20010611154917.F7798@vestdata.no>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>
> BTW: It isn't clear from your previous mail that this in fact a
> filesystem problem. The output from fsck may or may not confirm that it

Though this is a big off-topic, I have compiled the 2.4.5 kernel with reiser
within it, but I moved back immediatedly  to 2.4.4 after I saw that
unmounting a Reiserfs LV causes an oops -- and a kernel hang when trying to
unmount further Reiserfs LVs... ouch... not strange that there might be data
corruption with this kernel version!

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)
