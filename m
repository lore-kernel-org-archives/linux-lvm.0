Return-Path: <jan@moria.gondor.com>
Date: Sat, 13 Jan 2001 17:04:08 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
Message-ID: <20010113170408.A4296@gondor.com>
References: <20010113011532.B21587@srv.t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010113011532.B21587@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Sat, Jan 13, 2001 at 01:15:32AM +0000
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

On Sat, Jan 13, 2001 at 01:15:32AM +0000, Heinz J. Mauelshagen wrote:
> We'ld appreciate a couple of days for test feedback before pushing a 2.4.0
> patch to Linus.

It still has the problem I reported on Dec 22. On Dec 23 I wrote:

: Ok, I found the problem: The sort order of the pv's is wrong, and 0.9 is
: missing the code that sorts them. 0.8final's pv_read_all_pv_of_vg.c contains
: 
:       for ( p = 0; pv_tmp[p] != NULL; p++) {
:          if ( strcmp ( pv_tmp[p]->vg_name, vg_name) == 0) {
:             pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
:             np++;
:          }
:       }
: 
: and 0.9's doesn't.

Jan
