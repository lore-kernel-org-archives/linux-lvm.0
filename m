Date: Thu, 23 Aug 2012 21:27:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120823202737.GA5772@agk-dp.fab.redhat.com>
References: <1345728662-28052-1-git-send-email-mbooth@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1345728662-28052-1-git-send-email-mbooth@redhat.com>
Subject: Re: [linux-lvm] [PATCH] dmsetup: fix sscanf return check
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
To: Matthew Booth <mbooth@redhat.com>
Cc: linux-lvm@redhat.com

On Thu, Aug 23, 2012 at 02:31:02PM +0100, Matthew Booth wrote:
> -	if (sscanf(ptr, "%llu %llu %s %n",
> -		   &start, &size, ttype, &n) < 3) {
> +	if (sscanf(ptr, "%llu %llu %s %n", &start, &size, ttype, &n) != 4) {

Did you test this?

According to the sscanf man page:

       n      Nothing is expected; instead, the number of characters  consumed
              thus  far  from  the  input  is stored through the next pointer,
              which must be a pointer to  int.   This  is  not  a  conversion,
              although  it can be suppressed with the * assignment-suppression
              character.  The C standard says: "Execution of  a  %n  directive
              does  not increment the assignment count returned at the comple-
              tion of execution" but the Corrigendum seems to contradict this.
              Probably it is wise not to make any assumptions on the effect of
              %n conversions on the return value.

Alasdair
