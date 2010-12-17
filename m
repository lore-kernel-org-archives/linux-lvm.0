Date: Fri, 17 Dec 2010 18:46:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20101217184616.GA19317@agk-dp.fab.redhat.com>
References: <4D0B9D71.3080602@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D0B9D71.3080602@gmail.com>
Subject: Re: [linux-lvm] Conflicting vg names but can't rename one
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
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

What version of lvm2?

Try a newer one in case it's something we already fixed.
(An entry in 2.02.63 changelog might be relevant.)

If it still fails on the latest upstream, obtain output with
the -vvvv flags and post a link to it.

Alasdair
