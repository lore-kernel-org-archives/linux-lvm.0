Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3AFBE004.293FA66F@in.tum.de>
Date: Fri, 11 May 2001 14:50:12 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Graphical tool for LVM?
References: <3AF91E23.163C9119@in.tum.de> <wxxzocl2vqo.fsf@gjallarhorn.ifi.uio.no>
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

    I'm thinking about doing a cfdisk-like ncurses-program (just in case
we can't start X) that will be linked against the liblvm-10.so library.
Or has someone of you ever typed something like
# addpartition /dev/hda --number 1 --sectors 1-483 --type 0xc
???

Cheers,
--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod@in.tum.de)
