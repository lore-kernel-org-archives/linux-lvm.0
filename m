References: <1597231111-28086-1-git-send-email-heming.zhao@suse.com>
	<c86aeb1a-f7fd-000b-228d-e43029f25478@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7568aefd-aa87-b549-4eb9-237acf02ab82@redhat.com>
Date: Thu, 13 Aug 2020 21:01:10 +0200
MIME-Version: 1.0
In-Reply-To: <c86aeb1a-f7fd-000b-228d-e43029f25478@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] tests: use correct RA size,
	underly dev & delay time.
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
To: LVM general discussion and development <linux-lvm@redhat.com>, "heming.zhao@suse.com" <heming.zhao@suse.com>

Dne 12. 08. 20 v 15:32 heming.zhao@suse.com napsal(a):
> a little more info about my patch.
> in one of my test env, system default read_ahead size is 1024 sector (512K),
> which bigger than 128k in test case. which causes _set_dev_node_read_ahead() to deny
> to set up RA.
> 

Hi

Yeah - RA testing is a bit tricky - we had some issues whit systems 
interfering with 'tuned' on RHEL which has been changing RA after
device creation.

We did same adaptation of other tests to handle multiple possible values.

I'll check what this test is doing.

Zdenek
