Return-Path: <robf@geekthing.com>
Date: Sat, 13 Jan 2001 16:35:15 -0600
From: Rob Fugina <robf@geekthing.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
Message-ID: <20010113163514.A24224@goliath.geekthing.com>
References: <20010113011532.B21587@srv.t-online.de> <20010113170408.A4296@gondor.com>
Mime-Version: 1.0
In-Reply-To: <20010113170408.A4296@gondor.com>; from list039@gondor.com on Sat, Jan 13, 2001 at 05:04:08PM +0100
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

On Sat, Jan 13, 2001 at 05:04:08PM +0100, Jan Niehusmann wrote:
> On Sat, Jan 13, 2001 at 01:15:32AM +0000, Heinz J. Mauelshagen wrote:
> > We'ld appreciate a couple of days for test feedback before pushing a 2.4.0
> > patch to Linus.
> 
> It still has the problem I reported on Dec 22. On Dec 23 I wrote:
> 
> : Ok, I found the problem: The sort order of the pv's is wrong, and 0.9 is
> : missing the code that sorts them. 0.8final's pv_read_all_pv_of_vg.c contains
> : 
> :       for ( p = 0; pv_tmp[p] != NULL; p++) {
> :          if ( strcmp ( pv_tmp[p]->vg_name, vg_name) == 0) {
> :             pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
> :             np++;
> :          }
> :       }
> : 
> : and 0.9's doesn't.

I wonder if this is why I lost all of my data last Thursday...

vg w/ 2 pv's (hde1 & hdg1) and 3 lv's.  Add a pv (hdc1) and
reboot, and all of a sudden, even though the vg is still there,
with 3 pv's and 3 lv's, the lv's won't even fsck (bad magic
number in superblock -- doesn't even look like a filesystem was
even there).  I though maybe it had a problem w/ rearranging the
pv's or something...  How else could it completely lose track
of my data?

It was kernel 2.4.0 w/ the several-line vg_extend patch, and the 0.9
tools...

Oh, well -- just a WAG...

Rob

-- 
Rob Fugina, Systems Guy
robf@geekthing.com -- http://www.geekthing.com
My firewall filters MS Office attachments.

               Mud is not one of the four food groups.
