# DFtools
Linux Forensics tools
# Digital Forensics Tools Installation Script

This repository contains a bash script to check and install essential digital forensics tools on a Linux system. These tools are crucial for performing various digital forensics tasks, such as disk analysis, memory forensics, network analysis, and file recovery.

## Tools Covered

1. **The Sleuth Kit (TSK)**
   - **Importance:** A collection of command-line tools for investigating disk images, including file system analysis and file recovery.
   - **Run:** `icat or ils or mactime`

2. **Autopsy**
   - **Importance:** A graphical interface to The Sleuth Kit for analyzing hard drives and smartphones.
   - **Run:** `autopsy`

3. **Wireshark**
   - **Importance:** A network protocol analyzer for capturing and interactively browsing network traffic.
   - **Run:** `wireshark`

4. **Volatility**
   - **Importance:** An open-source memory forensics framework for analyzing the runtime state of a system.
   - **Run:** `cd volatility3 and python3 vol.py -h`

5. **Foremost**
   - **Importance:** A console program to recover files based on their headers, footers, and internal data structures.
   - **Run:** `foremost`

6. **dc3dd**
   - **Importance:** An enhanced version of `dd` with additional features useful for forensics.
   - **Run:** `dc3dd`

7. **ExifTool**
   - **Importance:** A tool to read, write, and edit metadata information for many file types.
   - **Run:** `exiftool`

8. **Bulk Extractor**
   - **Importance:** Scans a disk image and extracts useful information like email addresses, credit card numbers, and URLs.
   - **Run:** `bulk_extractor`

9. **RegRipper**
   - **Importance:** Open-source tool that is written in Perl and extracts/parses information like keys, values, data, etc. from the Registry database for data analysis..
   - **Run:** `regripper`

10. **PhotoRec**
    - **Importance:** A tool that supports recovery of lost files from hard disk, optical media, and digital camera.
    - **Run:** `photorec`

## How to Use the Script

### Prerequisites

- A Debian-based Linux distribution (e.g., Ubuntu).
- `sudo` privileges for installing software.

### Instructions

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/Dxvan06/DFtools.git
   cd DFtools.sh
2. **Use the below command:**
   ```sh
   chmod +x DFtools.sh
   ./DFtools.sh

