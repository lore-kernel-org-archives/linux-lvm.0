Subject: Re: [linux-lvm] How big is a PV?
References: <87vgd1935x.fsf@papadoc.bayour.com>
    <20020213112404.B7457@sistina.com> <87eljp8wox.fsf@papadoc.bayour.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <87eljp8wox.fsf@papadoc.bayour.com>
Message-Id: <873d03829k.fsf@papadoc.bayour.com>
MIME-Version: 1.0
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
Date: Fri Feb 15 04:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Turbo" == Turbo Fredriksson <turbo@bayour.com> writes:

    Turbo> Quoting "Heinz J . Mauelshagen" <mauelshagen@sistina.com>:
    >> Following patch should help. Will be in CVS soon.

I haven't upgraded my kernel yet, but by exporting the LD_LIBRARY_PATH=./lib,
and running

        ./vgcfgrestore -ll -v -n vg1

I get 

        PV Size               15.55 GB [32611887 secs] / NOT usable 4.18 MB [LVM: 139 KB]

So what's '32611887 secs'? Number of blocks?



assassination Delta Force Cuba Treasury NORAD SDI CIA Clinton bomb
cracking attack Cocaine strategic fissionable PLO
[See http://www.aclu.org/echelonwatch/index.html for more about this]
