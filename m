From: Todd Gill <tgill@redhat.com>
Date: Fri, 24 Jan 2020 14:58:28 -0500
Message-Id: <20200124195830.6720-1-tgill@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH 0/2] JSON output for dmstats
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
To: linux-lvm@redhat.com
Cc: tgill@redhat.com

This set of patches adds "--reportformat basic|json" options for the
dmstats list and report commands.

In the case where --count is specified with the JSON reportformat, the
output will be <count> consecutive JSON documents.

Example output of a single iteration of "report" in JSON:

{
    "report": [{
        "stats_name": "mirrorvg-mirrorlv",
        "group_id": "-",
        "region_id": "0",
        "obj_type": "area",
        "area_id": "0",
        "area_start": "0",
        "area_len": "1.00g",
        "reads_merged_per_sec": "0.00",
        "writes_merged_per_sec": "0.00",
        "reads_per_sec": "0.00",
        "writes_per_sec": "0.00",
        "read_size_per_sec": "0",
        "write_size_per_sec": "0",
        "avg_request_size": "0",
        "queue_size": "0.00",
        "util": "0.00",
        "await": "0.00",
        "read_await": "0.00",
        "write_await": "0.00"
   }]
}

The above JSON has been reformatted for line length, but the content
is from dmstats using this change.

Example output of "list" in JSON:

{
    "list": [{
        "stats_name": "mirrorvg-mirrorlv",
        "group_id": "-",
        "region_id": "0",
        "obj_type": "region",
        "region_start": "0",
        "region_len": "1.00g",
        "area_count": "1",
        "area_len": "1.00g",
        "program_id": "dmstats"
    }]
}

Todd Gill (2):
  Add JSON output support to dmstats for list and report subcommands
  Update man page to include --reportformat for list and report
    subcommands

 libdm/dm-tools/dmsetup.c | 45 +++++++++++++++++++++++++++++++++-------
 man/dmstats.8_main       | 11 ++++++++++
 2 files changed, 48 insertions(+), 8 deletions(-)

-- 
2.21.1
