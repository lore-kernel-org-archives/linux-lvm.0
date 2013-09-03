Message-ID: <52259B2E.6090602@redhat.com>
Date: Tue, 03 Sep 2013 10:17:50 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <l02rvj$uab$1@ger.gmane.org>
In-Reply-To: <l02rvj$uab$1@ger.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question before merging snapshot
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: news-io-dx32@spamfilter.de

On 09/02/2013 10:21 PM, Ron Schneider wrote:
>
> Hi all,
>
> Situation:
>
> I have a volume A that contains production data.
> For an experiment I created volume a' from A using
> the snapshot function.
> I then used a' for my experiment, which went very well.
>
> Now I want to merge snapshot a' back into A. I have read that the merge
> will effectively make A to be what a' was before, then a' will
> disappear. However, all examples that I found on the net referred to
> making snapshot a' then making changes to the origin A and finally using
> --merge to revert A back to a'.
> In my case though, I used the snapshot a' for writing instead of origin
> A. I just want you to confirm that --merge will function the same way
> nevertheless, thus making the modified content of a' appear in the
> origin LV A.
> Of course I will backup everything before the merge but I'd like to save
> myself unnecessary recovery cycles so I thought I'd just ask the pros
> beforehand - just to be sure.

Hi, what's in the snapshot will become content of the origin, regardless 
where the writes go.

When writing to origin, merge will revert the changes made to origin 
since snapshot was taken.

When writing to snapshot, merge will promote the changes made in the 
snapshot to the origin.

When writing to both, changes to origin will be reverted and changes 
made in snapshot will be promoted.

-- Marian

>
