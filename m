Date: Mon, 23 Sep 2013 22:10:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130923211049.GE24022@agk-dp.fab.redhat.com>
References: <51E981EF.3020007@gmail.com> <51E99A85.8060901@redhat.com>
	<51E9BD58.4030301@gmail.com>
	<20130719232052.GB23574@agk-dp.fab.redhat.com>
	<51EDEE5E.4010009@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51EDEE5E.4010009@gmail.com>
Subject: Re: [linux-lvm] pvmove
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Papik <mp6058@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 23, 2013 at 05:45:50AM +0300, Martin Papik wrote:
> * IMHO vgs/lvs/pvs should have an command line parameter, or option  
> modifier allowing to not display empty columns, i.e. the following  
> command might skip displaying origin, snap%, move, log, copy%, convert,  
> because they have no values. That would allow me to show copy_percent  
> column only when copy is in progress. Would be nice.

Yes - I'm surprised we never had this suggested before.

- Some columns will gain a property saying they can be suppressed when empty.

- A new cmdline option/config setting to suppress empty fields.

- Implemented as an extension alongside the 'sort' option.  (Like sort, you
  have to have all the output data prepared before you find out whether any
  columns are empty - even the headings can't be output before this point.)

- A way to flag an output data entry as empty.  (zkabelac is about to commit
  some patches to tidy up the handling of empty fields so this change can
  follow those.)

Alasdair
