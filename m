Date: Mon, 6 Apr 2009 23:52:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Why the problem with LVcreate with a specific name?
Message-ID: <20090406225249.GF5688@agk.fab.redhat.com>
References: <004b01c9b709$6f1b7970$4d526c50$@gr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004b01c9b709$6f1b7970$4d526c50$@gr>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theophanis Kontogiannis <theophanis_kontogiannis@yahoo.gr>
Cc: linux-lvm@redhat.com

Look at kernel messages.
A failed earlier command perhaps?
Output of 
# dmsetup info -c 
would tell you if it was that.

Alasdair
-- 
agk@redhat.com
