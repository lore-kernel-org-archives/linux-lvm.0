Return-Path: <bluca@comedia.it>
Date: Fri, 20 Apr 2001 08:41:22 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] 2.4.3-ac{6,7} LVM hang
Message-ID: <20010420084122.B12971@colombina.comedia.it>
References: <Pine.LNX.4.21.0104161653140.14442-100000@imladris.rielhome.conectiva>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0104161653140.14442-100000@imladris.rielhome.conectiva>; from riel@conectiva.com.br on Mon, Apr 16, 2001 at 04:55:15PM -0300
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 16, 2001 at 04:55:15PM -0300, Rik van Riel wrote:
> Hi,
> 
> 2.4.3-ac4 seems to work great on my test box (UP K6-2 with SCSI
> disk), but 2.4.3-ac6 and 2.4.3-ac7 hang pretty hard when I try
> to access any of the logical volumes on my test box.
> 
sorry i am a bit late on ac releases (ac3 at the moment)
does ac6/7 include lvm 0.9.1beta7, does the problem happen
with stock kernel lvm, wich was b2 afaik, or with lvm patches applied?
in the former case, why bother? b2 is broken anyway.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
